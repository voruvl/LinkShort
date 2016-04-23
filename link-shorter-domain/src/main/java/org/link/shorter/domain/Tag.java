package org.link.shorter.domain;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "tags")
public class Tag implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private Long id;
	
	private String name;
	
	private Set<Link> links = new HashSet<Link>();

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "ID")
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	@Column(name = "NAME")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@ManyToMany( fetch=FetchType.EAGER)
	@JoinTable(name = "LINK_TAG",joinColumns = @JoinColumn(name = "TAG_ID"), 
	inverseJoinColumns = @JoinColumn(name = "LINK_ID") )
	public Set<Link> getLinks() {
		return links;
	}

	public void setLinks(Set<Link> links) {
		this.links = links;
	}

	@Override
	public String toString() {
		return "Tag [id=" + id + ", name=" + name + "]";
	}

}