package db;

import servlets.Item;

import java.util.ArrayList;
import java.util.List;

public class DBManager {
    private static Long id  = 6L;
    private static List<Item> itemList = new ArrayList<>();

    static {
        itemList.add(new Item(1L, "Создать Веб приложение на JAVA EE", "Да", "2021-10-23"));
        itemList.add(new Item(2L, "Убраться дома и закупить продукты", "Да", "2021-10-25"));
        itemList.add(new Item(3L, "Выполнить все домашние задания", "Нет", "2021-10-28"));
        itemList.add(new Item(4L, "Записаться на качку", "Нет", "2021-12-12"));
        itemList.add(new Item(5L, "Учить Итальянский", "Нет", "2021-05-01"));

    }
    public static List<Item> getItemList() {
        return itemList;
    }
    public static void addItem(Item item) {
        item.setId(id);
        itemList.add(item);
        id++;
    }
    public static Item getItembyId(Long id){
        Item foundItem = null;
        for(Item it: itemList){
            if(it.getId() == id) {
                foundItem = it;
            }
        }
        return foundItem;
    }

    public static void deleteItem(Long id){
        Item foundItem = null;
        for(Item it: itemList){
            if(it.getId() == id) {
                foundItem = it;
            }
        }
        if(foundItem !=null){
            itemList.remove(foundItem);
        }
    }

    public static void saveItem(Item item){
        for (int i = 0; i < itemList.size(); i++) {
            if(itemList.get(i).getId() == item.getId()) {
                itemList.set(i, item);
            }
        }
    }
}
