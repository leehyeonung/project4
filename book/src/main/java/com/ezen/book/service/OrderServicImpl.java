package com.ezen.book.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ezen.book.domain.OrderVO;
import com.ezen.book.domain.PagingVO;
import com.ezen.book.repository.OrderDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class OrderServicImpl implements OrderService {

	@Inject
	private OrderDAO odao;
	
	

	@Override
	public int getTotalCount(PagingVO pvo) {
		// TODO Auto-generated method stub
		return odao.searchTotalCount(pvo);
	}



	@Override
	public List<OrderVO> getList(PagingVO pvo, String status, int mem_num) {
				log.info(">>> board list check2");
				if(status.equals("주문")) {
					return odao.selectOrderList(mem_num);				
				}else {
				return odao.selectBuyList(mem_num);
				}
		}
	}



	


