export interface Campaign {
    idCampaign: number;
    campaignJoinDate: Date;
    numberOfServices: number;
    customerSeniority: number;
    discount: number;
    discountStartDate: Date;
    discountEndDate: Date;
    status: string;
}