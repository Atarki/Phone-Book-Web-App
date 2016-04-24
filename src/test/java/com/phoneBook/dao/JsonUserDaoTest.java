package com.phoneBook.dao;

import com.phoneBook.models.User;
import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.mockito.Mockito.*;


public class JsonUserDaoTest {
    JsonUserDao jsonUserDao;

    @Before
    public void setup() {
        jsonUserDao = new JsonUserDao();
    }

    @Test
    public void testFindByUsername() throws Exception {
        //prepare
        User user = new User();
        user.setUsername("user");

        //then
        User actual = jsonUserDao.findByUsername(user.getUsername());

        //verify
        assertNotNull(actual);
        assertEquals(user.getUsername(), actual.getUsername());
    }

    @Test(expected = Exception.class)
    public void testSave() throws Exception {
        //prepare
        User user = mock(User.class);
        user.setUsername("user");

        //when
        doThrow(new Exception()).when(jsonUserDao).findByUsername(user.getUsername());

        //then
        jsonUserDao.save(user);

        //verify
        verify(jsonUserDao).save(user);
        verify(jsonUserDao, times(1)).save(user);
    }
}