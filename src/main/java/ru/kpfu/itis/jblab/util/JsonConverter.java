package ru.kpfu.itis.jblab.util;

import org.codehaus.jackson.map.ObjectMapper;
import ru.kpfu.itis.jblab.pojo.Operation;

import java.io.IOException;
import java.util.List;

public class JsonConverter {
    public static String[] getOperationJson(List<ru.kpfu.itis.jblab.model.Operation> operations) {
        int size = operations.size();
        int i = 0;
        String[] operationsArray = new String[size];
        for (ru.kpfu.itis.jblab.model.Operation operation : operations) {
            operationsArray[i] = toJson(OperationConverter.convert(operation));
        }
        return operationsArray;
    }

    private static String toJson(Operation operation) {
        ObjectMapper mapper = new ObjectMapper();
        String jsonInString = "";
        try {
            jsonInString = mapper.writeValueAsString(operation);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return jsonInString;
    }
}
