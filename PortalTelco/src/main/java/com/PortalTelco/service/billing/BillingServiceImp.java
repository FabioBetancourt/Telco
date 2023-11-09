package com.PortalTelco.service.billing;

import com.PortalTelco.model.Billing;
import com.PortalTelco.repository.billing.BillingRepositoryInterfaceJPA;
import org.apache.commons.io.output.ByteArrayOutputStream;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.List;

@Service
public class BillingServiceImp implements BillingService{

    private final BillingRepositoryInterfaceJPA billingRepositoryInterfaceJPA;

    public BillingServiceImp(BillingRepositoryInterfaceJPA billingRepositoryInterfaceJPA) {
        this.billingRepositoryInterfaceJPA = billingRepositoryInterfaceJPA;
    }
    @Override
    public List<Billing> getBillingsByCustomerId(Long fkIdCustomer) {
        return billingRepositoryInterfaceJPA.findBillingsByFkIdCustomer(fkIdCustomer);
    }

    @Override
    public List<Billing> findCustomersWithDiscount() {
        return billingRepositoryInterfaceJPA.findByDiscountNotZero();
    }

    @Override
    public byte[] createExcelFile(List<Billing> billings) {
        try (XSSFWorkbook workbook = new XSSFWorkbook()) {
            XSSFSheet sheet = workbook.createSheet("Billings");

            // Crear la fila del encabezado
            String[] headerColumns = {"ID", "Valor", "Descuento", "Valor total", "Fecha fin de descuento"};
            Row headerRow = sheet.createRow(0);
            for (int i = 0; i < headerColumns.length; i++) {
                Cell cell = headerRow.createCell(i);
                cell.setCellValue(headerColumns[i]);
            }

            CreationHelper createHelper = workbook.getCreationHelper();
            CellStyle dateCellStyle = workbook.createCellStyle();
            dateCellStyle.setDataFormat(createHelper.createDataFormat().getFormat("dd-MM-yyyy"));

            // Llenar las filas de datos
            int rowCount = 1;
            for (Billing billing : billings) {
                Row row = sheet.createRow(rowCount++);

                row.createCell(0).setCellValue(billing.getIdBilling());
                row.createCell(1).setCellValue(billing.getValue());
                row.createCell(2).setCellValue(billing.getDiscount());
                row.createCell(3).setCellValue(billing.getValueDiscount());
                Cell dateCell = row.createCell(4);
                if (billing.getDiscountEndDate() != null) {
                    dateCell.setCellValue(billing.getDiscountEndDate());
                    dateCell.setCellStyle(dateCellStyle); // Asignar el estilo de fecha aquí
                } else {
                    dateCell.setCellValue("N/A");
                }
            }

            // Ajustar el tamaño de todas las columnas para que se ajusten al contenido
            for (int i = 0; i < headerColumns.length; i++) {
                sheet.autoSizeColumn(i);
            }

            // Escribir el contenido a un ByteArrayOutputStream
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            workbook.write(outputStream);
            return outputStream.toByteArray();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
