package ru.kpfu.itis.jblab.util;

import ru.kpfu.itis.jblab.pojo.Operation;

public class OperationConverter {
    public static Operation convert(ru.kpfu.itis.jblab.model.Operation operationModel) {
        Operation operation = new Operation();
        String operationTypeName = operationModel.getOperationType().getName();
        switch (operationTypeName) {
            case "expense":
                operation.setCategory("Расходы");
                break;
            case "income":
                operation.setCategory("Доходы");
                break;
            case "transfer":
                operation.setCategory("Переводы");
                break;
            case "debt":
                operation.setCategory("Долги");
                break;
        }
        operation.setDate(operationModel.getDate());
        operation.setName(operationModel.getComment());
        operation.setWay(operationModel.getAccount().getName());
        operation.setPrice(operationModel.getAmount());
        return operation;
    }
}
