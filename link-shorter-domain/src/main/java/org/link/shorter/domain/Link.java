package org.link.shorter.domain;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Random;
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
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "links")
public class Link implements Serializable {
	private static final long serialVersionUID = 1L;

	private Long id;

	private String fullLink;
	
	private String shortLink;

	private String description;

	private User user;

	private int count;

	private Set<Tag> tags = new HashSet<Tag>();

	public void addTag(Tag tag) {
		tags.add(tag);
	}

	public void removeTag(Tag tag) {
		tags.remove(tag);
	}

	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name = "LINK_TAG", joinColumns = @JoinColumn(name = "LINK_ID"),
	inverseJoinColumns = @JoinColumn(name = "TAG_ID"))
	public Set<Tag> getTags() {
		return this.tags;
	}

	public void setTags(Set<Tag> tags) {
		this.tags = tags;
	}

	public String generateShortLink() {
		StringBuilder shortLink = new StringBuilder("");
		Random random = new Random();
		shortLink.append(random.nextInt(10));
		shortLink.append((char) (random.nextInt(26) + 65));
		shortLink.append(random.nextInt(10));
		shortLink.append(random.nextInt(10));
		shortLink.append((char) (random.nextInt(26) + 97));
		shortLink.append(random.nextInt(10));
		shortLink.append((char) (random.nextInt(26) + 97));
		return shortLink.toString();
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID")
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Column(name = "FULL_LINK")
	public String getFullLink() {
		return fullLink;
	}

	public void setFullLink(String fullLink) {
		this.fullLink = fullLink;
		setShortLink(generateShortLink());
	}

	@Column(name = "SHORT_LINK")
	public String getShortLink() {
		return shortLink;
	}

	public void setShortLink(String shortLink) {
		this.shortLink = shortLink;
	}

	@Column(name = "DESCRIPTION")
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@ManyToOne
	@JoinColumn(name = "USER_ID")
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Column(name = "COUNT")
	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public void incCount() {
		this.count++;
	}

	@Override
	public String toString() {
		return "Link [id=" + id + ", fullLink=" + fullLink + ", shortLink=" + shortLink + ", description=" + description
				+ ", user=" + user + "]";
	}

}