package com.phoneBook.dao;


import com.phoneBook.entity.Contact;

import java.sql.SQLException;
import java.util.List;

public interface ContactDao {
    public List<Contact> getAll(int userId) throws SQLException, ClassNotFoundException;

    public Contact get(int i);

    public void delete(int i);

    public void add(Contact contact);

    public void edit(Contact contact);
}
